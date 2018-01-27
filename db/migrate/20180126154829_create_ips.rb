class CreateIps < ActiveRecord::Migration[5.1]
  def up
    execute %{
      CREATE VIEW ips AS
        SELECT posts.ip AS ip, array_agg(DISTINCT users.login) AS users
        FROM posts
        LEFT JOIN users ON users.id = posts.user_id
        GROUP BY posts.ip
        HAVING sum(posts.user_id) > 1
    }
  end
  def down
    execute %{
      DROP VIEW ips;
    }
  end
end
