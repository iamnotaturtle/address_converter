defmodule AddressConverterTest do
  use ExUnit.Case
  doctest AddressConverter

  describe "to_ss58/1" do
    test "converts EVM address to Substrate address" do
      evm_address = "0x57d3ca64f4745b1936e34b3296238246895aecf3"
      expected_substrate_address = "5HiApnQsLxC6Qfc5gdnYmZmC2hes7PYW53dLqN54Sgejf7zi"
      assert AddressConverter.to_ss58(evm_address) == expected_substrate_address
    end
  end
end
