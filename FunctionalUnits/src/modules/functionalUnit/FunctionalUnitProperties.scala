package modules.functionalUnit

import chisel3.Bundle

trait FunctionalUnitProperties {

    /*
     * Get Name of instantiated module
     */
    final def getName() = {
        this.getClass.getSimpleName
    }

    /*
     *
     */
    def getIO(): Bundle;
}
