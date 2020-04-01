class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validate :repeated_artist
    validates :release_year, presence: true, 
    if: :released?
    validate :date_not_poss
    






    def repeated_artist
        if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
        errors.add(:title, "can't add the same song twice")
        end 
    end 

    def date_not_poss
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "this year is not possible")
        end 
    end 
end
