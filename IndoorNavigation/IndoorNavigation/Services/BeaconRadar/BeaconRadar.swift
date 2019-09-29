//
//  BeaconRadar.swift
//  IndoorNavigation
//
//  Created by Aleksey Rochev on 28.09.2019.
//  Copyright © 2019 Aleksey Rochev. All rights reserved.
//

import Foundation
import CoreLocation

enum State {
    case enabled
    case disabled
    case notAvailable
}

class BeaconRadar: NSObject {

    // MARK: - Public Properties

    private(set) var state: State = .disabled
    var baseBeacon: Beacon?

    var didEnteredToWorkRegion: EmptyBlock?
    var didCameoutToWorkRegion: EmptyBlock?
    var didUpdateDistance: CLProximityBlock?
    var didCheckIn: BeaconBlock?

    // MARK: Private Properties

    private var locationManager: CLLocationManager
    private var lastBeacon: CLBeacon?

    init(with locationManager: CLLocationManager) {
        self.locationManager = locationManager
        super.init()
        configure()
    }

    // MARK: Public Methods

    func configure() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    func scaning() {
        guard let beacon = baseBeacon?.region else {
            return
        }
        locationManager.startMonitoring(for: beacon)
        locationManager.startRangingBeacons(in: beacon)
    }
}

// MARK: - CLLocationManagerDelegate

extension BeaconRadar: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    scaning()
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        guard !beacons.isEmpty else {
            updateDistance(.unknown)
            return
        }
        beacons.filter { $0.proximity == .immediate }.forEach { beacon in
            if beacon.minor != self.lastBeacon?.minor ||
               beacon.major != self.lastBeacon?.major {
                self.checkIn(beacon: beacon)
                self.lastBeacon = beacon
            }
        }
    }

    func checkIn(beacon: CLBeacon) {
        didCheckIn?(beacon.convertBeacon)
    }

    func updateDistance(_ distance: CLProximity) {
        didUpdateDistance?(distance)
    }
}

extension Beacon {

    var region: CLBeaconRegion? {
        guard let uuid = UUID(uuidString: uuid) else {
                return nil
        }
        return CLBeaconRegion(proximityUUID: uuid,
                              identifier: "com.example.myDeviceRegion")
    }

}

extension CLBeacon {
    var convertBeacon: Beacon {
        return Beacon(identifier: self.proximityUUID.uuidString,
                      uuid: self.uuid.uuidString,
                      major: UInt16(truncating: self.major),
                      minor: UInt16(truncating: self.minor))
    }
}
