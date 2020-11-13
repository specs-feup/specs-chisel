package modules

import chisel3.Bundle

trait FunctionalUnitProperties {

    /*
     * Get Name of instantiated module
     */
    def getName(): String;

    /*
     *
     */
    def getIO(): Bundle;
}
