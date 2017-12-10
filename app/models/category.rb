class Category < ActiveRecord::Base
    # CarrierWave
    mount_uploader :cate_image, CateImageUploader
    
    validates_presence_of :image
end
