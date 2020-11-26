require 'test_helper'

class SalariesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
    @salary = salaries(:one)
  end

  test "should get index" do
    get :index, params: { employee_id: @employee }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { employee_id: @employee }
    assert_response :success
  end

  test "should create salary" do
    assert_difference('Salary.count') do
      post :create, params: { employee_id: @employee, salary: @salary.attributes }
    end

    assert_redirected_to employee_salary_path(@employee, Salary.last)
  end

  test "should show salary" do
    get :show, params: { employee_id: @employee, id: @salary }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { employee_id: @employee, id: @salary }
    assert_response :success
  end

  test "should update salary" do
    put :update, params: { employee_id: @employee, id: @salary, salary: @salary.attributes }
    assert_redirected_to employee_salary_path(@employee, Salary.last)
  end

  test "should destroy salary" do
    assert_difference('Salary.count', -1) do
      delete :destroy, params: { employee_id: @employee, id: @salary }
    end

    assert_redirected_to employee_salaries_path(@employee)
  end
end
