class CreateSearchHistories < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE VIEW search_histories AS
        SELECT searches.term AS term,
        MAX(created_at) AS latest_date,
        COUNT(*) AS search_count
      FROM
        searches
      GROUP BY
        searches.term
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW search_histories
    SQL
  end
end
