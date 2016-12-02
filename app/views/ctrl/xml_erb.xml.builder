xml.book(:isbn=>@book.isbn) do
	xml.title do 
		xml.title(@book.title)
	end
	xml.price(@book.price)
	xml.publish(@book.publish)
end