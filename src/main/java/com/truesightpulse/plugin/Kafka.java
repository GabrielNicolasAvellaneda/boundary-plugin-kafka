package com.truesightpulse.plugin;

import com.boundary.plugin.sdk.PluginRunner;
import com.boundary.plugin.sdk.jmx.JMXPlugin;

public class Kafka extends JMXPlugin {

    public static void main(String[] args) {
        
        //PluginRunner plugin = new PluginRunner(Kafka.class.getName());                
        PluginRunner plugin = new PluginRunner("com.boundary.plugin.sdk.jmx.JMXPlugin");
        plugin.run();
    }

}
