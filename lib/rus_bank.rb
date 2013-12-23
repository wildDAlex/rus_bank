# encoding: utf-8
require 'savon'

class RusBank
  def initialize
    @client = Savon.client(wsdl: "http://www.cbr.ru/CreditInfoWebServ/CreditOrgInfo.asmx?WSDL")
  end

  def operations
    @client.operations
  end

  def BicToIntCode(bic)
    params = { "BicCode" => bic }
    call(:bic_to_int_code, params)
  end

  def BicToRegNumber(bic)
    params = { "BicCode" => bic }
    call(:bic_to_reg_number, params)
  end

  def RegNumToIntCode(reg_num)
    params = { "RegNumber" => reg_num }
    call(:reg_num_to_int_code, params)
  end

  def IntCodeToRegNum(int_code)
    params = { "IntNumber" => int_code }
    call(:int_code_to_reg_num, params)
  end

  def SearchByRegionCodeXML(region_code)
    params = { "RegCode" => region_code }
    response = call(:search_by_region_code_xml, params)
    if response.nil?
      nil
    else
      response[:credit_org][:enum_credits]
    end
  end

  def EnumBicXML
    response = call(:enum_bic_xml)
    if response.nil?
      nil
    else
      response[:enum_bic][:bic]
    end
  end

  def RegionsEnumXML
    response = call(:regions_enum_xml)
    if response.nil?
      nil
    else
      response[:regions_enum][:rgid]
    end
  end

  def CreditInfoByIntCodeXML(internal_code)
    params = { "InternalCode" => internal_code }
    response = call(:credit_info_by_int_code_xml, params)
    if response.nil?
      nil
    else
      response[:credit_org_info][:co]
    end
  end

  def call(method, params = nil)
    response = @client.call(method, message: params).to_hash[(method.to_s + "_response").to_sym][(method.to_s + "_result").to_sym]
    if response == "-1" or response.to_s.include?("NotFound")           # Разные методы сервиса возвращают ответ в разном формате
      return nil
    else
      response
    end
  end
end