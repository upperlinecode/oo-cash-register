describe 'AmazonTransaction' do
  let(:amazon_transaction) { AmazonTransaction.new }
  let(:amazon_transaction_with_discount) { AmazonTransaction.new(20) }
 

  describe '::new' do
    it 'sets an instance variable for @total on initialization to zero' do
      expect(amazon_transaction.instance_variable_get(:@total)).to eq(0)
    end

    it 'sets an instance variable for @items on initialization equal to an empty array' do
      expect(amazon_transaction.instance_variable_get(:@items)).to match_array([])
    end

    it 'takes an *optional* employee discount argument, @discount (using a default argument) on initialization' do
      expect(amazon_transaction_with_discount.instance_variable_get(:@discount)).to eq(20)
    end
  end

  describe '#total' do
    it 'returns the current total' do
      amazon_transaction.total = 100
      expect(amazon_transaction.total).to eq(100)
    end
  end

  describe '#add_item' do
    it 'accepts two arguments, title and price, and increases the total' do
      amazon_transaction.add_item("eggs", 0.98)
      expect(amazon_transaction.total).to eq(0.98)
    end

    it 'adds the purchased item to the @items array' do
      amazon_transaction.add_item("eggs", 0.98)
      expect(amazon_transaction.items).to include("eggs")
    end

    it 'accepts a quantity as an *optional* third argument' do
      expect{amazon_transaction.add_item("book", 5.00, 3)}.to change{amazon_transaction.total}.by(15.00)
    end

    it "doesn't forget about the previous total" do
      amazon_transaction.add_item("Lucky Charms", 4.5)
      expect(amazon_transaction.total).to eq(4.5)
      amazon_transaction.add_item("Ritz Crackers", 5.0)
      expect(amazon_transaction.total).to eq(9.5)
      amazon_transaction.add_item("Justin's Peanut Butter Cups", 2.50, 2)
      expect(amazon_transaction.total).to eq(14.5)
    end
  end

  describe '#apply_discount' do
    context 'with employee discount argument passed in at initialization' do
      it 'applies the discount to the total price' do
        amazon_transaction_with_discount.add_item("MacBook Air", 1000)
        amazon_transaction_with_discount.apply_discount
        expect(amazon_transaction_with_discount.total).to eq(800)
      end

      it 'returns a success message with updated total' do
        amazon_transaction_with_discount.add_item("MacBook Air", 1000)
        expect(amazon_transaction_with_discount.apply_discount).to eq("After the discount, the total comes to $800.")
      end

      it 'changes the total' do
        amazon_transaction.total = 0
        amazon_transaction_with_discount.add_item("macbook air", 1000)
        expect{amazon_transaction_with_discount.apply_discount}.to change{amazon_transaction_with_discount.total}.by(-200)
      end
    end

    context 'when the cash register was not initialized with an employee discount' do
      it 'returns a string error message that there is no discount to apply' do
        expect(amazon_transaction.apply_discount).to eq("There is no discount to apply.")
      end
    end
  end

  describe '#items' do
    it 'returns an array containing all items that have been added' do
      new_register = AmazonTransaction.new
      new_register.add_item("eggs", 1.99)
      new_register.add_item("tomato", 1.76, 3)
      expect(new_register.items).to eq(["eggs", "tomato", "tomato", "tomato"])
    end
  end


  # BONUS: uncomment out each test to work on this part
  # describe '#cancel_order' do
  #   it 'subtracts the last transaction from the total' do
  #     amazon_transaction.add_item("tomato", 1.76)
  #     expect{amazon_transaction.cancel_order}.to change{amazon_transaction.total}.by(-1.76)
  #   end
  # end

  #Completing this test requires knowledge of class variables, class methods and self. 
  # describe '.transaction_codes' do
  #  it 'generates a random, six-digit code when a transaction is created' do
  #       expect(amazon_transaction.transaction_code).to be > 100000
  #       expect(amazon_transaction.transaction_code).to be < 999999
  #    end

  # it 'at the creation of a new transaction it saves each transaction\'s code to a class variable called transaction_codes' do
  #    expect(AmazonTransaction.transaction_codes.length).to eq(16)
  #  end
  # end

  #  describe '#print_receipt' do
  #     it 'prints the customer\'s receipt to a .txt file' do
  #       amazon_transaction_with_discount.add_item("cereal", 3.45)
  #       amazon_transaction_with_discount.add_item("orange juice", 2.00)
  #       amazon_transaction_with_discount.apply_discount
  #       amazon_transaction_with_discount.print_receipt
  #       receipt = File.read("receipt.txt")
  #       expect(receipt).to eq("Your Receipt\nItems:\ncereal, orange juice\nDiscount applied: 20%\nTotal: $4.36")
  #     end
  # end
end





