class AddUsersToReviews < ActiveRecord::Migration[5.2]
  def up
    add_reference :reviews, :user, index: true #add field
    Review.reset_column_information
    user = User.first #all existing reviews given to first user

    Review.all.each do |review| #populate field
      review.user_id = user.id
      review.save!
    end

    change_column_null :reviews, :user_id, false #chnage to not allow nulls
    add_foreign_key :reviews, :users #add foreign keys
  end

  def down
    remove_foreign_key :reviews, :users #removes column and foreign key
    remove_reference :reviews, :user, index: true
  end
end
