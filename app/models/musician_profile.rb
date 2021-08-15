class MusicianProfile < ApplicationRecord
  has_one_attached :video
  attachment :image
  belongs_to :end_user
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum area: {hokkaido:0,aomori:1,iwate:2,miyagi:3,akita:4,yamagata:5,fukushima:6,
     ibaraki:7,tochigi:8,gunma:9,saitama:10,chiba:11,tokyo:12,kanagawa:13,nigata:14,
     toyama:15,ishikawa:16,fukui:17,yamanashi:18,nagano:19,gifu:20,shizuoka:21,aichi:22,
     mie:23,shiga:24,kyoto:25,osaka:26,hyogo:27,nara:28,wakayama:29,tottori:30,
     shimane:31,okayama:32,hiroshima:33,yamaguchi:34,tokushima:35,kagawa:36,ehime:37,kochi:38,
     fukuoka:39,saga:40,nagasaki:41,kumamoto:42,oita:43,miyazaki:44,kagoshima:45, okinawa:46}

  enum genre: {pops:0, rock:1, electronica:2, hiphop:3, raggae:4, r_and_b:5,
  country:6, world:7, enka:8, japanese_old_pops:9, jazz:10, classic:11, others:12}

  scope :get_by_genre, ->(genre) {where(genre: genre)}
end
