class SalariesController < ApplicationController
  before_action :set_employee
  before_action :set_salary, only: [:show, :edit, :update, :destroy]

  # GET employees/1/salaries
  def index
    @salaries = @employee.salaries
  end

  # GET employees/1/salaries/1
  def show
  end

  # GET employees/1/salaries/new
  def new
    @salary = @employee.salaries.build
  end

  # GET employees/1/salaries/1/edit
  def edit
  end

  # POST employees/1/salaries
  def create
    @salary = @employee.salaries.build(salary_params)

    if @salary.save
      redirect_to([@salary.employee, @salary], notice: 'Salary was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT employees/1/salaries/1
  def update
    if @salary.update_attributes(salary_params)
      redirect_to([@salary.employee, @salary], notice: 'Salary was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE employees/1/salaries/1
  def destroy
    @salary.destroy

    redirect_to employee_salaries_url(@employee)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    def set_salary
      @salary = @employee.salaries.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def salary_params
      params.require(:salary).permit(:salary, :effective)
    end
end
