library TestLib initializer Init requires Utility



    private function setUpHybrid takes nothing returns nothing

         {{GENERATE}}

    endfunction



    public function Init takes nothing returns nothing
        call setUpHybrid()
    endfunction



endlibrary

