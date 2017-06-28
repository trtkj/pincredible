class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("default.png")
  end

  process resize_to_limit: [600, nil]

  version :thumb do
    process resize_to_limit: [220, nil]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
