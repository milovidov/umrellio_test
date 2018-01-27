class CreateIps < ActiveRecord::Migration[5.1]
  def up
    execute %{
      CREATE MATERIALIZED VIEW ips AS
        SELECT posts.ip AS ip, array_agg(DISTINCT users.login) AS users
        FROM posts
        LEFT JOIN users ON users.id = posts.user_id
        GROUP BY posts.ip
        HAVING sum(posts.user_id) > 1
    }
    execute %{
      CREATE UNIQUE INDEX
        ip_idx
      ON
        ips(ip)
    }
    execute %{
      CREATE OR REPLACE FUNCTION
        refresh_ips()
        RETURNS TRIGGER LANGUAGE PLPGSQL
      AS $$
      BEGIN
        REFRESH MATERIALIZED VIEW ips;
        RETURN NULL;
        EXCEPTION
          WHEN feature_not_supported THEN
            RETURN NULL;
      END $$;
    }
    execute %{
      CREATE TRIGGER refresh_ips
      AFTER
        INSERT OR
        UPDATE OR
        DELETE
      ON posts
        FOR EACH STATEMENT
          EXECUTE PROCEDURE
            refresh_ips();
    }
  end
  def down
    execute %{
      DROP TRIGGER refresh_ips ON posts;
    }
    execute %{
      DROP FUNCTION refresh_ips;
    }
    execute %{
      DROP MATERIALIZED VIEW ips;
    }
  end
end
