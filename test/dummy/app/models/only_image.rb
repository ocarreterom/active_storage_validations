class OnlyImage < ApplicationRecord
  has_one_attached :image
  has_one_attached :proc_image
  validates :image, dimension: { width: { min: 100, max: 2000 }, height: { min: 100, max: 1500 } },
                    aspect_ratio: :is_16_9,
                    content_type: ['image/png', 'image/jpg']
  validates :proc_image, dimension: { width: { min: -> (record) {100}, max: -> (record) {2000} }, height: { min: -> (record) {100}, max: -> (record) {1500} } },
            aspect_ratio: -> (record) {:is_16_9},
            content_type: -> (record) {['image/png', 'image/jpg']}
end
