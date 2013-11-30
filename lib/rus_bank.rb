require 'savon'

class RusBank
  def initialize
    @client = Savon.client(wsdl: "http://www.cbr.ru/CreditInfoWebServ/CreditOrgInfo.asmx?WSDL")
  end

  def operations
    @client.operations
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

  def BicToIntCode(bic)
    params = { "BicCode" => bic }
    call(:bic_to_int_code, params)
  end

  def BicToRegNumber(bic)
    params = { "BicCode" => bic }
    call(:bic_to_reg_number, params)
  end

  def call(method, params)
    response = @client.call(method, message: params).to_hash[(method.to_s + "_response").to_sym][(method.to_s + "_result").to_sym]
    if response == "-1" or response.to_s.include?("NotFound")           # Разные методы сервиса возвращают ответ в разном формате
      return nil
    else
      response
    end
  end
end