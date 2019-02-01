require 'minitest/autorun'
require_relative '../owner'

class TestOwner < Minitest::Test

    def setup
      options = {"id" => 1, "name" => "Susan Hunter", "address" => "18 Hillend Rd", "contact_num" => "07367122334"}

      @owner = Owner.new(options)
    end



  def test_owner_has_name
    assert_equal("Susan Hunter", @owner.name)
  end


    def test_owner_has_id
      assert_equal(1, @owner.id)
    end


      def test_owner_has_address
        assert_equal("18 Hillend Rd", @owner.address)
      end


        def test_owner_has_contact_num
          assert_equal("07367122334", @owner.contact_num)
        end

end
