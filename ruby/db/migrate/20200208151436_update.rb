class Update < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :color
    end

    create_table :achievements do |t|
      t.string :name
      t.numeric :xp
      t.references :categories, foreign_key: true
    end

    create_table :associations do |t|
      t.string :name
      t.string :email
      t.string :phone
    end

    create_table :levels do |t|
      t.string :name
      t.numeric :xpneeded
      t.text :description
    end

    create_table :events do |t|
      t.string :name
      t.numeric :capacity
      t.text :description
      t.numeric :xp
      t.references :associations, foreign_key: true
      t.references :categories, foreign_key: true
    end

    create_table :users, force: :cascade do |t|
      t.string :name
      t.string :password
      t.string :salt
      t.string :email
      t.string :phone
      t.date :birth
      t.numeric :actualxp
      t.text :picture
      t.references :levels, foreign_key: true
    end

    create_table :other_users, force: :cascade do |t|
      t.string :name
      t.string :password
      t.string :salt
      t.string :email
      t.string :phone
      t.date :birth
      t.numeric :actualxp
      t.text :picture
      t.references :levels, foreign_key: true
    end

    create_table :friendships, force: :cascade do |t|
      t.integer "user_id"
      t.integer "other_user_id"
      t.date :startedate
    end

    create_table :achievements_Assignation, force: :cascade do |t|
      t.integer "user_id"
      t.integer "achievement_id"
      t.date :startedate
    end
  end
end
