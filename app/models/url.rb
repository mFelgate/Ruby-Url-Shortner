class Url < ApplicationRecord
    after_save  :add_short_url
    def add_short_url
        if shortUrl.blank?
            num = id
            alphabet_array = [*'a'..'z', *'0'..'9']
            short_url = ""
            while num >0
                index = num % 36
                short_url = short_url + alphabet_array[index]
                num = num/36
            end 

            update_column(:shortUrl, short_url)
        end
    end
    #Use callbacks to share common setup or constraints between actions.
end
