require "spec_helper"

describe Savon2::Builder do

  subject(:builder) { Savon2::Builder.new(:create_object, wsdl, globals, locals) }

  let(:globals)     { Savon2::GlobalOptions.new }
  # let(:locals)      { Savon2::LocalOptions.new }
  let(:wsdl)        { Wasabi::Document.new Fixture.wsdl(:brand) }
  let(:no_wsdl)     { Wasabi::Document.new }

  describe "#to_s" do
    it "defaults to include the default envelope namespace of :env" do
      message = {
        :message=>{
          :template_object=>{
            :longName=>"Zertico LLC Reseller"
          }
        }
      }

      locals = Savon2::LocalOptions.new(message)
      builder = Savon2::Builder.new(:create_object, wsdl, globals, locals)
      expect(builder.to_s).to eq('<?xml version="1.0" encoding="UTF-8"?><env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://api.service.softlayer.com/soap/v3/" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/"><env:Body><tns:createObject><templateObject><longName>Zertico LLC Reseller</longName></templateObject></tns:createObject></env:Body></env:Envelope>')
    end
  end
end
