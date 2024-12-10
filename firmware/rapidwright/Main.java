// This file should be placed in the RapidWright repository at RapidWright/src/

import com.xilinx.rapidwright.design.Design;
import com.xilinx.rapidwright.design.*;
import edu.byu.shorty.shorts.ShortTools;
import edu.byu.shorty.rapidwrighttools.RapidWrightTools;

import com.xilinx.rapidwright.design.Net;
import com.xilinx.rapidwright.device.*;
import com.xilinx.rapidwright.router.*;
import com.xilinx.rapidwright.rwroute.*;
import edu.byu.shorty.rapidwrighttools.BELID;
import edu.byu.shorty.rapidwrighttools.BELConfig;

import java.util.ArrayList;
import java.util.List;

import static edu.byu.shorty.rapidwrighttools.RapidWrightTools.countLut6;
import static edu.byu.shorty.rapidwrighttools.RapidWrightTools.getGndNet;

public class Main {

    public static void main(String[] args){
        // 1 cycle SC
        String dcpPath = "D:/Vivado_Projects/AES_UART/checkpoint_cycles_7_8/checkpoint_cycles_7_8.dcp";

        // 2 cycle SC
        //String dcpPath = "D:/Vivado_Projects/AES_UART/checkpoint_2_cycles/checkpoint_2_cycles.dcp";

        // 5 cycle SC
        //String dcpPath = "D:/Vivado_Projects/AES_UART/checkpoint_5_cycles/checkpoint_5_cycles.dcp";

        String deviceName = "xc7a35t";

        Device device = Device.getDevice(deviceName);
        //Site s = device.getSite("SLICE_X0Y0");

        Design design = Design.readCheckpoint(dcpPath);

        Net n = design.getNet("enable_sc");

        Router r = new Router(design);

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

        ShortTools.createShortedRegion(design, 0, 65, 81, 106, n);

        design.writeCheckpoint("D:/Vivado_Projects/AES_UART/checkpoint_cycles_7_8/checkpoint_cycles_7_8_6900_sc.dcp");
        //System.out.println(s);
    }
}
