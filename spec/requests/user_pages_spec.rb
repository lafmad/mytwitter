#coding: utf-8
require 'spec_helper'

describe "用户页面" do
	subject {page}

	describe "注册页面" do
		before {visit signup_path}
		let(:submit){"Create my account"}

		describe "错误的注册信息" do
			it "注册失败" do
				expect {click_button submit}.not_to change(User,:count)
			end
		end

		describe "合法的注册信息" do
			before do
				fill_in "Name",         with: "Example User"
				fill_in "Email",        with: "user@example.com"
				fill_in "Password",     with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end

			it "注册成功" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

		end
	end
end
