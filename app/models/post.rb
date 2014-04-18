class Post < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments

  has_attached_file :picture, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" },
    storage: :s3,
    bucket: 'gangstagram-images',
  s3_credentials: {
    access_key_id: Rails.application.secrets.aws_id,
    secret_access_key: Rails.application.secrets.aws_key
  }

  validates_attachment_content_type :picture, content_type: ["image/jpg", "image/jpeg", "image/png"]

  geocoded_by :address   # can also be an IP address
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city    = geo.city
    end
  end
  after_validation :geocode, :reverse_geocode          # auto-fetch coordinates


  def tag_names
    tags.map(&:name).join
  end

  def tag_names=(tag_names)
    tag_names.split(' ').uniq.each do |tag_name|
      tag_name.prepend('#') unless tag_name[0] == '#'
      tag = Tag.find_or_create_by(name: tag_name.downcase)
      tags << tag
    end
  end

end
