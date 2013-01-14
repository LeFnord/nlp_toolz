# coding: utf-8
require "spec_helper"

describe String do
  before(:each) do
    @a = %w[ " ' „ “ ‘ ‘ ’ “ ” « » ‹ › ]
  end
  
  it "should delete quotations marks" do
    @a.join("").clean_up.should be_empty
    chars =  (@a.length - 1) * 3
    @a.join(" ap").clean_up.length.should == chars
    @a.join("ap ").clean_up.length.should == chars                      
  end
  
  
end