#coding: utf-8
require 'spec_helper'

describe User do
	before do 
		@user = User.new(name:"lafmad",email:"lafmad@gmail.com",password:"lafmad",password_confirmation:"lafmad")
	end

	subject {@user}

	it {should be_valid}
	it {should respond_to(:password_confirmation)}

	describe "密码为空" do
		before {@user.password = @user.password_confirmation = " "}
		it {should_not be_valid}
	end

	describe "密码是否正确" do
		before {@user.save}
		let(:found_user) {User.find_by_email(@user.email)}

		describe "密码正确" do
			it {should == found_user.authenticate(@user.password)}
		end

		describe "密码错误" do
			let(:user_for_invalid_password) {found_user.authenticate("wrongpassword")}
			it {should_not == user_for_invalid_password}
			specify {user_for_invalid_password.should be_false}
		end
	end

end



