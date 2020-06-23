	require 'spec_helper'
 
describe 'baseusers', :type => 'class' do
    
  context "Should create users and groups from passed hash" do
    let(:params) {{
      :users => {
        'hosting' => {
          'name' => 'hosting',
          'home' => '/home/hosting',
          'shell' => '/bin/bash',
          'uid'  => '1010',
          'gid'  => '1010',
          'comment' => 'Hosting User',
          'password' => '*'
            },
        'user' => {
          'name' => 'user',
          'home' => '/home/user',
          'shell' => '/bin/bash',
          'uid'  => '1010',
          'gid'  => '1010',
          'comment' => 'User User',
          'password' => '*'
          }
        },
        :groups => {
          'admin' => {
            'name' => 'admin',
            'gid'  => '109'
            },
          'hosting' => {
            'gid' => '1010',
            'name' => 'hosting'
          }
        }
      }}
  
    it {
      should contain_user('hosting').with_ensure('present').with(
        'name' => 'hosting',
        'home' => '/home/hosting',
        'shell' => '/bin/bash',
        'uid'  => '1010',
        'gid'  => '1010',
        'comment' => 'Hosting User',
        'password' => '*',
        'managehome' => true,
      )
    }      
    
    it {
      should contain_user('user').with_ensure('present').with(
        'name' => 'user',
          'home' => '/home/user',
          'shell' => '/bin/bash',
          'uid'  => '1010',
          'gid'  => '1010',
          'comment' => 'User User',
          'password' => '*',
          'managehome' => true,
        )
    }

    it {
      should contain_group('admin').with_ensure('present').with(
        'name' => 'admin',
        'gid'  => '109'
      )
    }    
    
    it{
      should contain_group('hosting').with_ensure('present').with(
        'name' => 'hosting',
        'gid'  => '1010'
      )
    }
    
  end
end
