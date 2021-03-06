class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  layout 'form', :only => [:new, :edit]

  # GET /departments
  # GET /departments.json
  def index
    @departments = current_user.departments
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @departments = current_user.departments
    @employees = current_user.employees.where(:department => @department)
    @employees_count = current_user.employees.where(:department => @department).count
    @total_cost = BigDecimal.new(0)
    @employees.each do |employee|
      unless employee.salaries.last.nil?
        @salary = employee.salaries.last.salary
        @total_cost += @salary
      end
    end
  end

  # GET /departments/new
  def new
    @department = current_user.departments.build
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = current_user.departments.build(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:title, :user_id)
    end
end
