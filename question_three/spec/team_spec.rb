require 'team'

describe Team do
  let(:team_reedsy)         { Team.new         }
  let(:new_member_name)     { 'phil brockwell' }
  let(:another_member_name) { 'robert pulson'  }
  let(:last_member_name)    { 'michael paul'   }

  context 'When initialsed' do
    it 'Has 0 members' do
      expect(team_reedsy.members.length).to eq(0)
    end
  end

  context 'Adding members' do
    it 'New member is added to the members' do
      team_reedsy << new_member_name
      expect(team_reedsy.members.length).to eq(1)
      expect(team_reedsy.members[0].name).to eq(new_member_name)
    end
  end

  context 'Members names' do
    it 'returns an array of the members names' do
      team_reedsy << new_member_name
      team_reedsy << another_member_name
      expect(team_reedsy.members_names)
        .to eq([new_member_name, another_member_name])
    end
  end

  context 'Pro names' do
    it 'returns an array of the members names upcased' do
      team_reedsy << new_member_name
      team_reedsy << another_member_name
      expect(team_reedsy.pro_names)
        .to eq([new_member_name.capitalize, another_member_name.capitalize])
    end

    it 'returns the limit if the limit is passed in' do
      10.times { team_reedsy << new_member_name }
      pro_names_array = team_reedsy.pro_names(2)
      expect(pro_names_array.length).to eq(2)
    end

    it 'returns just the first ten names if no limit is passed in' do
      10.times { team_reedsy << new_member_name }
      team_reedsy << another_member_name
      pro_names_array = team_reedsy.pro_names
      expect(pro_names_array.length).to eq(10)
      expect(pro_names_array).not_to include(another_member_name)
    end
  end

  context 'Reverse Names' do
    it 'returns an array of the members names in reverse order, reversed' do
      team_reedsy << new_member_name
      team_reedsy << another_member_name
      reversed_names_array = team_reedsy.reverse_names
      expect(reversed_names_array)
        .to eq([another_member_name.reverse, new_member_name.reverse])
    end

    it 'returns all the names downcased' do
      team_reedsy << new_member_name.upcase
      team_reedsy << another_member_name.upcase
      reversed_names_array = team_reedsy.reverse_names
      expect(reversed_names_array)
        .to eq([another_member_name.reverse.downcase, new_member_name.reverse.downcase])
    end
  end

  context 'Presented Names' do
    it 'adds a title to the beginning of the array' do
      team_reedsy << new_member_name
      team_reedsy << another_member_name
      presented_names = team_reedsy.present_names
      expect(presented_names.first).to eq('Members:')
    end

    it 'returns an array of the names with an asterix' do
      team_reedsy << new_member_name
      team_reedsy << another_member_name
      presented_names = team_reedsy.present_names
      expect(presented_names)
        .to eq(['Members:', "* #{new_member_name}", "* #{another_member_name}"])
    end

    it 'can sort the names' do
      team_reedsy << new_member_name
      team_reedsy << another_member_name
      team_reedsy << last_member_name
      presented_names = team_reedsy.present_names(sort: true)
      expect(presented_names)
        .to eq(['Members:', "* #{last_member_name}",
                            "* #{new_member_name}",
                            "* #{another_member_name}"])
    end

    it 'can reverse the names' do
      team_reedsy << new_member_name
      team_reedsy << another_member_name
      team_reedsy << last_member_name
      presented_names = team_reedsy.present_names(reverse: true)
      expect(presented_names)
        .to eq(['Members:', "* #{last_member_name}",
                            "* #{another_member_name}",
                            "* #{new_member_name}"])
    end

    it 'can shuffle the names' do
      team_reedsy << new_member_name
      team_reedsy << another_member_name
      team_reedsy << last_member_name
      allow_any_instance_of(Array).to receive(:shuffle)
        .and_return([new_member_name, last_member_name, another_member_name])
      presented_names = team_reedsy.present_names(shuffle: true)
      expect(presented_names)
        .to eq(['Members:', "* #{new_member_name}",
                            "* #{last_member_name}",
                            "* #{another_member_name}"])
    end
  end

  context 'Funny Print' do
    it 'can add a new suffix to each names' do
      team_reedsy << new_member_name
      allow_any_instance_of(Array).to receive(:sample)
        .and_return('ish')
      funnied_names = team_reedsy.funny_names
      expect(funnied_names).to eq(['philish brockwellish'])
    end
  end
end
