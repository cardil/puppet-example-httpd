require 'spec_helper'

describe 'httpd::vhost' do
  let(:title) { 'blog.example.org' }
  let(:params) do
    { docroot: '/var/www/blog' }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
