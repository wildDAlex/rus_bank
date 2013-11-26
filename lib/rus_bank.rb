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
    call(:credit_info_by_int_code_xml, params)[:credit_org_info][:co]
  end

  # BIC must be specified as string, for ex. BicToIntCode("044585216")
  def BicToIntCode(bic)
    params = { "BicCode" => bic }
    call(:bic_to_int_code, params)
  end

  def BicToRegNumber(bic)
    params = { "BicCode" => bic }
    call(:bic_to_reg_number, params)
  end

  def call(method, params)
    response = @client.call(method, message: params).to_hash
    response[(method.to_s + "_response").to_sym][(method.to_s + "_result").to_sym]
  end
end