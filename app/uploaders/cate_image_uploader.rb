# encoding: utf-8

class CateImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick #使用minimagick处理压缩图片，确保安装magickimage这个东东，ubuntu可以sudo apt-get install magickimage

  # Choose what kind of storage to use for this uploader: 
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  
  #定义上传到哪个文件夹下
  def store_dir 
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end 

  #可以定义默认图片，如过用户没有上传图片，则可以使用默认的图片    
  def default_url  
    ""
  end

  #图片的处理，有不同版本大小，网站可以在不同的地方调用不同的图片大小 
  version :normal do
    process :resize_to_fill => [48, 48]
  end
  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  
  #指定上传文件的格式
  def extension_white_list
    %w(jpg jpeg gif png)   
  end
  # Override the filename of the uploaded files:  
  # Avoid using model.id or version_name here, see uploader/store.rb for details.  
  
  def filename
    #"something.jpg"
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end
end