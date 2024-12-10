package com.xilinx.rapidwright.examples;// This file should be placed in the RapidWright repository at RapidWright/src/

import com.xilinx.rapidwright.design.Design;
import com.xilinx.rapidwright.design.Net;
import com.xilinx.rapidwright.device.Device;
import com.xilinx.rapidwright.examples.shorty.ShortTools;
import com.xilinx.rapidwright.router.Router;

public class Main {

    public static void main(String[] args){
        // 1 cycle SC
        String dcpPath = "/<path to .dcp file>/sensor.dcp";

        String deviceName = "xc7a35t";

        Device device = Device.getDevice(deviceName);
        //Site s = device.getSite("SLICE_X0Y0");

        Design design = Design.readCheckpoint(dcpPath);

        Net n = design.getNet("enable_sc");
//        Router r = new Router(design);
        
        //Router r = new Router(design);

        // 1000 SCs
        //ShortTools.createShortedRegion(design, 56, 65, 43, 67, n);

        // 2000 SCs
        //ShortTools.createShortedRegion(design, 46, 65, 43, 67, n);

        // 3000 SCs
        //ShortTools.createShortedRegion(design, 36, 65, 43, 67, n);

        // 4000 SCs
        //ShortTools.createShortedRegion(design, 16, 65, 43, 67, n);

        // 5000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 67, n);

        // 6000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 72, n);

        // 7000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 77, n);

        // 8000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 82, n);

        // 9000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 87, n);

        // 10000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 92, n);

        // 12000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 102, n);

        // 13000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 107, n);

        // 14000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 112, n);

        // 15000 SCs
        //ShortTools.createShortedRegion(design, 0, 65, 43, 117, n);

        // SCs for cycles 8 and 9
        //ShortTools.createShortedRegion(design, 0, 65, 81, 130, n);

        ShortTools.createShortedRegion( design,50, 70, 50, 70, n);

        design.writeCheckpoint("/<path to .dcp output file>/sensor_sc.dcp");
        //System.out.println(s);
    }

}


