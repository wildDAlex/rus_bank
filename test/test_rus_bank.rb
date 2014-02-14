# encoding: utf-8
require "test_helper"

class TestRusBank < Test::Unit::TestCase

  VALID_BIC = "044585216"
  INVALID_BIC = "0445852169999"
  VALID_INT_CODE = "450000650"
  INVALID_INT_CODE = "450000650999999"
  VALID_REG_NUMBER = "316"
  INVALID_REG_NUMBER = "289375237580009"
  VALID_REGION = "16"
  INVALID_REGION = "999"
  INVALID_ORG_NAME = "djhgsjdlksl"
  VALID_ORG_NAME = "ХКФ БАНК"

  context "RusBank" do
    setup do
      @cbr = RusBank.new
    end

    should "Service return implemented methods" do
      assert_contains(@cbr.operations, :bic_to_int_code)
      assert_contains(@cbr.operations, :bic_to_reg_number)
      assert_contains(@cbr.operations, :enum_bic_xml)
      assert_contains(@cbr.operations, :credit_info_by_int_code_xml)
    end

    should ":bic_to_int_code return correct value" do
      assert_equal(VALID_INT_CODE, @cbr.BicToIntCode(VALID_BIC))
      assert_equal(nil, @cbr.BicToIntCode(INVALID_BIC), "Should return nil if value not found")
    end

    should ":bic_to_reg_number return correct value" do
      assert_equal(VALID_REG_NUMBER, @cbr.BicToRegNumber(VALID_BIC))
      assert_equal(nil, @cbr.BicToRegNumber(INVALID_BIC), "Should return nil if value not found")
    end

    should ":reg_num_to_int_code return correct value" do
      assert_equal(VALID_INT_CODE, @cbr.RegNumToIntCode(VALID_REG_NUMBER))
      assert_equal(nil, @cbr.RegNumToIntCode(INVALID_REG_NUMBER), "Should return nil if value not found")
    end

    should ":int_code_to_reg_num return correct value" do
      assert_equal(VALID_REG_NUMBER, @cbr.IntCodeToRegNum(VALID_INT_CODE))
      assert_equal(nil, @cbr.IntCodeToRegNum(INVALID_INT_CODE), "Should return nil if value not found")
    end

    should ":enum_bic_xml returns array of elements" do
      assert(@cbr.EnumBic.instance_of?(Array), "This should be array")
      assert(@cbr.EnumBic.length > 100, "This should return more than 100 elements")
    end

    should ":regions_enum_xml returns array of elements" do
      assert(@cbr.RegionsEnum.instance_of?(Array), "This should be array")
      assert(@cbr.RegionsEnum.length > 70, "This should return more than 70 elements")
    end

    should ":search_by_region_code_xml returns array of elements" do
      assert(@cbr.SearchByRegionCode(VALID_REGION).instance_of?(Array), "This should be array")
      assert(@cbr.SearchByRegionCode(VALID_REGION).length > 10, "This should return more than 10 banks")
      assert_equal(nil, @cbr.SearchByRegionCode(INVALID_REGION), "Should return nil if value not found")
    end

    should ":search_by_name_xml return correct value" do
      assert(@cbr.SearchByName(VALID_ORG_NAME).instance_of?(Array), "This should be array")
      assert_equal(VALID_ORG_NAME, @cbr.SearchByName(VALID_ORG_NAME).first[:org_name])
      assert_equal(nil, @cbr.SearchByName(INVALID_ORG_NAME), "Should return nil if value not found")
    end

    should ":get_offices_xml returns array of elements" do
      assert(@cbr.GetOffices(VALID_INT_CODE).instance_of?(Array), "This should be array")
      assert(@cbr.GetOffices(VALID_INT_CODE).length > 2, "This should return more than 2 offices")
      assert_equal(nil, @cbr.GetOffices(INVALID_INT_CODE), "Should return nil if value not found")
    end

    should ":get_offices_by_region_xml returns array of elements" do
      assert(@cbr.GetOfficesByRegion(VALID_REGION).instance_of?(Array), "This should be array")
      assert(@cbr.GetOfficesByRegion(VALID_REGION).length > 10, "This should return more than 10 offices")
      assert_equal(nil, @cbr.GetOfficesByRegion(INVALID_REGION), "Should return nil if value not found")
    end

    should ":credit_info_by_int_code_xml return correct bank" do
      assert_equal(VALID_REG_NUMBER, @cbr.CreditInfoByIntCode(VALID_INT_CODE)[:co][:reg_number])
      assert_equal(VALID_ORG_NAME, @cbr.CreditInfoByIntCode(VALID_INT_CODE)[:co][:org_name])
      assert_equal(VALID_BIC, @cbr.CreditInfoByIntCode(VALID_INT_CODE)[:co][:bic])
      assert_equal(nil, @cbr.CreditInfoByIntCode(INVALID_INT_CODE), "Should return nil if value not found")
    end

  end

end
