class Genre < ApplicationRecord

  has_many :musician_profiles
  has_many :shop_profiles

  enum genre_status: {ポップス:0, ロック:1, エレクトロニカ:2, ヒップホップ:3, レゲエ:4, R＆B:5, カントリー:6, ワールド:7, 演歌:8, 歌謡曲:9, ジャズ:10, クラシック:11, その他:12}
end
