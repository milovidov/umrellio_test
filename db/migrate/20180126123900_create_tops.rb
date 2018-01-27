class CreateTops < ActiveRecord::Migration[5.1]
  def up
    execute %{
    CREATE VIEW tops AS
      SELECT
        posts.id AS id,
        posts.title AS title,
        posts.body AS body,
        tops.rate AS rate,
        users.login AS login
      FROM (SELECT
              post_id,
              rate
            FROM rates
            ) AS tops LEFT JOIN posts ON tops.post_id = posts.id
        LEFT JOIN users ON users.id = posts.user_id
    }
  end

  def down
    execute %{
      DROP VIEW Tops;
    }
  end
end
