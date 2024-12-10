require "application_system_test_case"

class DetalhesVendasTest < ApplicationSystemTestCase
  setup do
    @detalhes_venda = detalhes_vendas(:one)
  end

  test "visiting the index" do
    visit detalhes_vendas_url
    assert_selector "h1", text: "Detalhes vendas"
  end

  test "should create detalhes venda" do
    visit detalhes_vendas_url
    click_on "New detalhes venda"

    fill_in "Produto", with: @detalhes_venda.produto_id
    fill_in "Quantidade", with: @detalhes_venda.quantidade
    fill_in "Subtotal", with: @detalhes_venda.subtotal
    fill_in "Venda", with: @detalhes_venda.venda_id
    click_on "Create Detalhes venda"

    assert_text "Detalhes venda was successfully created"
    click_on "Back"
  end

  test "should update Detalhes venda" do
    visit detalhes_venda_url(@detalhes_venda)
    click_on "Edit this detalhes venda", match: :first

    fill_in "Produto", with: @detalhes_venda.produto_id
    fill_in "Quantidade", with: @detalhes_venda.quantidade
    fill_in "Subtotal", with: @detalhes_venda.subtotal
    fill_in "Venda", with: @detalhes_venda.venda_id
    click_on "Update Detalhes venda"

    assert_text "Detalhes venda was successfully updated"
    click_on "Back"
  end

  test "should destroy Detalhes venda" do
    visit detalhes_venda_url(@detalhes_venda)
    click_on "Destroy this detalhes venda", match: :first

    assert_text "Detalhes venda was successfully destroyed"
  end
end
