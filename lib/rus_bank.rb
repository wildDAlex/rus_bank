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

  def SearchByRegionCode(region_code)
    params = { "RegCode" => region_code }
    response = call(:search_by_region_code_xml, params)
    get_array(response, :credit_org, :enum_credits)
  end

  def SearchByName(bank_name)    # Метод возвращает nil, либо массив хэшей
    params = { "NamePart" => bank_name }
    response = call(:search_by_name_xml, params)
    get_array(response, :credit_org, :enum_credits)
  end

  def GetOffices(int_code)
    params = { "IntCode" => int_code }
    response = call(:get_offices_xml, params)
    get_array(response, :co_offices, :offices)
  end

  def GetOfficesByRegion(region_code)
    params = { "RegCode" => region_code }
    response = call(:get_offices_by_region_xml, params)
    get_array(response, :co_offices, :offices)
  end

  def EnumBic
    response = call(:enum_bic_xml)
    get_array(response, :enum_bic, :bic)
  end

  def RegionsEnum
    response = call(:regions_enum_xml)
    get_array(response, :regions_enum, :rgid)
  end

  def CreditInfoByIntCode(internal_code)
    params = { "InternalCode" => internal_code }
    response = call(:credit_info_by_int_code_xml, params)
    if response.nil?
      nil
    else
      response[:credit_org_info]
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

  private

  def get_array(response, *params)
    node = params.inject(response){|inner_node, param| inner_node[param]}     # Вытягиваем вложенные ноды
    if node.nil?
      nil
    else
      if not node.instance_of?(Array)      # Если найдена одна запись, возвращается единичный хэш,
        [node]                             # если более одной, то массив хешей,
      else                                 # поэтому одну запись преобразуем к массиву из одного хэша.
        node
      end
    end
  end

end