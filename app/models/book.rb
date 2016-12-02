# Book 本クラス
# Author: Weiliang, Liang
# モデルクラスx
class Book < ActiveRecord::Base
  attr_accessible :cd, :isbn, :price, :publish, :published, :title
  has_and_belongs_to_many :authors
  has_many :reviews
  
  validates :isbn,
  			:presence => true,
			:uniqueness => true,
			:length => {:is => 17},
			:format => {:with=> /^[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}$/}
  validates :title,
  			:presence => true,
			:length => {:minimum => 1,:maximum =>100}
  validates :price,
  			:numericality => {:only_integer => true, :less_than => 10000}
  validates :publish,
     		:inclusion => {:in => ['技術評論社','翔泳社','秀和システム','日経BP社','インプレスジャパン']}
			
  # isbn 妥当性を検討する
  # ==== Parameters
  # * isbn_param 
  # * isbn_format
  # ==== Examples
  # validates :isbn,:isbn => true
  def test_method
  
  end
end
