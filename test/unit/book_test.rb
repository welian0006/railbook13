require 'test_helper'

class BookTest < ActiveSupport::TestCase
	#self.use_transactional_fixtures= true
	test 'book save' do
		book = Book.new({
			:isbn => '978-4-7741-4466-X',
			:title => 'Ruby on Rails本格入門',
			:price =>  3100,
			:publish => '技術評論社',
			:published => '2011-02-14',
			:cd=> false
		})
		assert book.save, 'Failed to save'
	end
	
	test 'book test2' do
		#assert false, 'books(:js) value is--->'+books(:js).isbn.to_s
		assert true
	end
	
	test 'book validate' do
		book = Book.new({
			:isbn => '978-4-7741-44',
			:title => 'JavaScript本格入門',
			:price => 3100,
			:publish => '技術評論社',
			:published => '2011-01-14',
			:cd => false
		})
		
		assert !book.save, 'Failed to validate'
		assert_equal book.errors.size,2, 'Failed to validate count'+book.errors.size.to_s
		assert book.errors[:isbn].any?, 'Failed to isbn validate'
	end
	
	test 'where method test' do
		result = Book.where(:title=> 'JavaScript本格入門').first
		assert_instance_of Book, result,'result is not instance of Book class is'+result.class.to_s
		assert_equal books(:js).isbn, result.isbn, 'isbn column is wrong.'
		assert_equal Date.new(2010,11,26), result.published,'published column is wrong.'
	end
	
	def setup
		@b = books(:js)
	end
	
	def teardown
		@b = nil
	end
	
	test 'where method test short' do
		result = Book.where(:title=> 'JavaScript本格入門').first
		assert_equal @b.isbn,result.isbn,'isbn column is wrong'
		assert_equal @b.published,result.published,'published column is wrong.'
	end
	
	test 'transactional' do
		begin
			Book.transaction do
				b1 = Book.new({:isbn => '978-4-7741-4223-0',
					:title => 'Rubyポケットリファレンス',:price =>2000,
					:publish =>'技術評論社',:published => '2011-01-01'})
				b1.save
				assert_equal 11,Book.count
				raise 'Failed!'
				b2 = Book.new({:isbn => '978-4-7741-4223-1',:title => 'Railsポケットリファレンス',:price => 2000,:publish => '技術評論社',:published=>'2011-01-01'})
				b2.save
			end
		rescue => e
			print 'important output is------------------->'+e.inspect
			assert_equal 10,Book.count
		end
	end
end
