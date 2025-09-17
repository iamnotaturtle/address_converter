defmodule AddressConverter do
  @moduledoc """
  Documentation for `AddressConverter`.
  """

  alias Base58
  alias Blake2.Blake2b

  @generic_substrate_address_prefix 42

  @doc """
  Given an EVM address, converts it to a Substrate one.
  Uses Hash Truncated Hash Mapping

  ## Examples

      iex> AddressConverter.to_ss58("0x10E0271ec47d55511a047516f2a7301801d55eaB")
      "5GDXvqASMPKNbnmSEt69CkbL6YwiN3sLbVqdPFW4cvC43zSH"

  """
  def to_ss58(evm_address) do
    # 1. Hash the address of the string
    hex = String.slice(evm_address, 2..-1//1)
    bin = Base.decode16!(hex, case: :mixed)
    prefixed_bin = "evm:" <> bin
    blake2_hash = Blake2b.hash(prefixed_bin, "", 32)

    # 2. Prefix with Substrate id
    prefixed_key = <<@generic_substrate_address_prefix>> <> blake2_hash

    # 3. Get the full bytes
    checksum = Blake2b.hash("SS58PRE" <> prefixed_key, "", 64)
    # For 32-byte public keys, we need first 2 bytes of the checksum
    checksum_bytes = binary_part(checksum, 0, 2)
    complete_bytes = prefixed_key <> checksum_bytes

    # 4. Base58 encode result
    Base58.encode(complete_bytes)
  end
end
