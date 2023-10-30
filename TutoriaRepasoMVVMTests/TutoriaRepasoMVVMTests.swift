//
//  TutoriaRepasoMVVMTests.swift
//  TutoriaRepasoMVVMTests
//
//  Created by Pedro on 30/10/23.
//

import XCTest
@testable import TutoriaRepasoMVVM

final class TutoriaRepasoMVVMTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCaseUseBootCampsReal() throws {
        let caseUse = CaseUseBootCamp()
        
        caseUse.loadBootcamps { boots in
            XCTAssertNotNil(boots)
        } onError: {
            XCTFail()
        }
    }
    
    func testCaseViewModelFake() throws {
        let expectation = self.expectation(description: "Eccept Boot")
        
        let vm = ViewModelBootCamps(caseUse: CaseUseBootCampFakeSuccess())
        XCTAssertNotNil(vm)
        
        vm.modelChange = {  boots in
            expectation.fulfill()
        }
        
        vm.loadBoocamps()
        
        wait(for: [expectation], timeout: 10.0)
        
    }
    
    //Se provoca un error
    func testCaseViewModelFakeError() throws {
        let expectation = self.expectation(description: "Eccept Boot")
        
        let vm = ViewModelBootCamps(caseUse: CaseUseBootCampFakeError())
        XCTAssertNotNil(vm)
        
        vm.modelStatusload = {  status in
            print("status: \(status)")
            if status == .error {
                expectation.fulfill()
            }
        }
        
        vm.loadBoocamps()
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    //View
    func testCaseView() throws {
        let expectation = self.expectation(description: "Eccept Boot")
        
        //ViewMOdel Fake
        let vm = ViewModelBootCamps(caseUse: CaseUseBootCampFakeSuccess())
        XCTAssertNotNil(vm)
        
        //table view controller
        let view = BootCampsTableViewController(viewModel: vm)
        XCTAssertNotNil(view)
        
        
        vm.modelChange = {  boots in
            XCTAssertEqual(boots.count ,3) //deben ser 3 boot mockeados
            expectation.fulfill()
        }
        
        //no se lanza el ViewDidLoad, por lo que teng que lanzarlo yo.
        vm.loadBoocamps()
        
        wait(for: [expectation], timeout: 10.0)
    }
}
