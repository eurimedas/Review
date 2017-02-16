//
//  GoogleMapsViewController.swift
//  TravelRecorder
//
//  Created by CAUCSE on 2017. 2. 12..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleMaps

class GoogleMapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        loadView()
    }
    
    
    override func loadView() {
        
        var cameraLatitude: Double = 0
        var cameraLongitude: Double = 0
        
        var detailInfo: Results<Detail>?
        
        let realm = try? Realm()
        
        detailInfo = realm?.objects(Detail.self)
 
        if let loc = detailInfo?.last {
            cameraLatitude = loc.latitude
            cameraLongitude = loc.longitude
            
        }
        //// 지도 객체 추가
        
        // 지도의 중앙과 확대/축소 수준 지정
        let camera = GMSCameraPosition.camera(withLatitude: cameraLatitude, longitude: cameraLongitude, zoom: 6)
        
        // GMSCameraPosition 객체를 필수 매개변수로 전달
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        // GMSMapView 객체를 뷰 컨트롤러의 뷰로 설정
        self.view = mapView
        
        
        
        
      
        if detailInfo != nil {
            
            for loc in detailInfo! {
            
                //// 마커
                
                // 마커 추가
                print("마커 위치")
                print(loc.simpleLocation)
                print(loc.detailLocation)
                print(loc.latitude)
                print(loc.longitude)
                let position = CLLocationCoordinate2D(latitude: loc.latitude, longitude: loc.longitude)
                let marker = GMSMarker(position: position)
                marker.title = loc.simpleLocation
                marker.map = mapView
                
                // 마커 제거
                // GMSMarker 의 map속성을 nil로 설정 or GMSMapView Clear 메서드 호출
                
                // mapView.clear()
                
                // marker.map = nil

            }
        }
        
        
        
      
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
