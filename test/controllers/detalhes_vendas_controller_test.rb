require "test_helper"

class DetalhesVendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalhes_venda = detalhes_vendas(:one)
  end

  test "should get index" do
    get detalhes_vendas_url
    assert_response :success
  end

  test "should get new" do
    get new_detalhes_venda_url
    assert_response :success
  end

  test "should create detalhes_venda" do
    assert_difference("DetalhesVenda.count") do
      post detalhes_vendas_url, params: { detalhes_venda: { produto_id: @detalhes_venda.produto_id, quantidade: @detalhes_venda.quantidade, subtotal: @detalhes_venda.subtotal, venda_id: @detalhes_venda.venda_id } }
    end

    assert_redirected_to detalhes_venda_url(DetalhesVenda.last)
  end

  test "should show detalhes_venda" do
    get detalhes_venda_url(@detalhes_venda)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalhes_venda_url(@detalhes_venda)
    assert_response :success
  end

  test "should update detalhes_venda" do
    patch detalhes_venda_url(@detalhes_venda), params: { detalhes_venda: { produto_id: @detalhes_venda.produto_id, quantidade: @detalhes_venda.quantidade, subtotal: @detalhes_venda.subtotal, venda_id: @detalhes_venda.venda_id } }
    assert_redirected_to detalhes_venda_url(@detalhes_venda)
  end

  test "should destroy detalhes_venda" do
    assert_difference("DetalhesVenda.count", -1) do
      delete detalhes_venda_url(@detalhes_venda)
    end

    assert_redirected_to detalhes_vendas_url
  end
end
