# coding: utf-8
require "spec_helper"

describe String do
  before(:each) do
    @a = %w[ " ' „ “ ‘ ‘ ’ “ ” « » ‹ › ]
  end
  
  it "should delete quotations marks" do
    expect(@a.join("").clean_up).to be_empty
    chars =  (@a.length - 1) * 3
    expect(@a.join(" ap").clean_up.length).to be == chars
    expect(@a.join("ap ").clean_up.length).to be == chars
  end
  
  
end