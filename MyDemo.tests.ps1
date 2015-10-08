Describe 'MyDemo testing' {
    Context DemoTests {
        It 'throws when given an error' {
            {throw} | Should throw
        }
        It 'Returns true' {
            $true | Should Be $true
        }
        It 'Fails on thirt test' {
            $true | Should Be $false
        }
    }
}
