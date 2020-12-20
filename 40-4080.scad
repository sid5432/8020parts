/*
 * If G8020FAKE is true, we substitute the actual profile with a plain square;
 * If G8020OUTERONLY is true, the holes are ignored;
 * If G8020DEBUG is true, the main item item40_4040() is shown, otherwise this is
 * a library; the item is not shown
 */
G8020FAKE = false;
G8020OUTERONLY = false;
G8020DEBUG = false;

module item40_4080(hh) {
  if ( G8020FAKE ) {
    cube([80,40,hh]);
  }else{
    linear_extrude(height=hh,center=false) {
      profile40_4080();
    }
  }
}

module profile40_4080() {
  if ( G8020OUTERONLY ) {
    translate([40,20]) outline40_4080();
  }else{
    translate([40,20]) difference() {
      outline40_4080();
      cutout40_4080();
    }
  }
}

module outline40_4080() {
    polygon( points = [
[14.3719, -20.0000],[0.0000, -20.0000],[14.8312, -19.9313],[15.6340, -19.3637],[15.9419, -18.4300],[15.9419, -18.4300],[15.9419, -17.2500],[15.8732, -16.7907],[15.3056, -15.9878],[14.3719, -15.6800],[14.3719, -15.6800],[11.2850, -15.6800],[10.8257, -15.6113],[10.0228, -15.0437],[9.7150, -14.1100],[9.7150, -14.1100],[9.7150, -13.6545],[9.9373, -13.1174],[9.9373, -13.1174],[13.9582, -9.0915],[14.5146, -8.6145],[15.3776, -8.1130],[16.3264, -7.8031],[17.3191, -7.6982],[17.3191, -7.6982],[22.6809, -7.6982],[23.4116, -7.7547],[24.3763, -8.0110],[25.2661, -8.4633],[26.0418, -9.0915],[26.0418, -9.0915],[30.0627, -13.1174],[30.2850, -13.6545],[30.2850, -13.6545],[30.2850, -14.1100],[30.2163, -14.5693],[29.6487, -15.3722],[28.7150, -15.6800],[28.7150, -15.6800],[25.6300, -15.6800],[25.1707, -15.7487],[24.3678, -16.3163],[24.0600, -17.2500],[24.0600, -17.2500],[24.0600, -18.4312],[24.1287, -18.8907],[24.6964, -19.6934],[25.6302, -20.0012],[25.6302, -20.0012],[36.8303, -20.0000],[37.7938, -19.8499],[38.6832, -19.4019],[39.3897, -18.7001],[39.8435, -17.8137],[40.0000, -16.8302],[40.0000, -16.8302],[40.0006, -5.6265],[39.9319, -5.1670],[39.3643, -4.3642],[38.4306, -4.0564],[38.4306, -4.0564],[37.2499, -4.0564],[36.7907, -4.1251],[35.9878, -4.6927],[35.6800, -5.6264],[35.6800, -5.6264],[35.6800, -8.7114],[35.6113, -9.1708],[35.0437, -9.9736],[34.1100, -10.2814],[34.1100, -10.2814],[33.6509, -10.2814],[33.1137, -10.0590],[33.1137, -10.0590],[29.1066, -6.0547],[28.6305, -5.4993],[28.1291, -4.6362],[27.8191, -3.6874],[27.7143, -2.6948],[27.7143, -2.6948],[27.7143, 0.0000],[27.7143, 0.0000],[27.7143, 2.6948],[27.7143, 2.6948],[27.8191, 3.6874],[28.1291, 4.6362],[28.6305, 5.4993],[29.1066, 6.0547],[33.1137, 10.0590],[33.1137, 10.0590],[33.6509, 10.2814],[34.1100, 10.2814],[34.1100, 10.2814],[35.0437, 9.9736],[35.6113, 9.1708],[35.6800, 8.7114],[35.6800, 5.6264],[35.6800, 5.6264],[35.9878, 4.6927],[36.7907, 4.1251],[37.2499, 4.0564],[38.4306, 4.0564],[38.4306, 4.0564],[39.3643, 4.3642],[39.9319, 5.1670],[40.0006, 5.6265],[40.0000, 16.8302],[40.0000, 16.8302],[39.8435, 17.8137],[39.3897, 18.7001],[38.6832, 19.4019],[37.7938, 19.8499],[36.8303, 20.0000],[25.6302, 20.0012],[25.6302, 20.0012],[24.6964, 19.6934],[24.1287, 18.8907],[24.0600, 18.4312],[24.0600, 17.2500],[24.0600, 17.2500],[24.3678, 16.3163],[25.1707, 15.7487],[25.6300, 15.6800],[28.7150, 15.6800],[28.7150, 15.6800],[29.6487, 15.3722],[30.2163, 14.5693],[30.2850, 14.1100],[30.2850, 13.6545],[30.2850, 13.6545],[30.0627, 13.1174],[26.0418, 9.0915],[26.0418, 9.0915],[25.2661, 8.4633],[24.3763, 8.0110],[23.4116, 7.7547],[22.6809, 7.6982],[17.3191, 7.6982],[17.3191, 7.6982],[16.3264, 7.8031],[15.3776, 8.1130],[14.5146, 8.6145],[13.9582, 9.0915],[9.9373, 13.1174],[9.9373, 13.1174],[9.7150, 13.6545],[9.7150, 14.1100],[9.7150, 14.1100],[10.0228, 15.0437],[10.8257, 15.6113],[11.2850, 15.6800],[14.3719, 15.6800],[14.3719, 15.6800],[15.3056, 15.9878],[15.8732, 16.7907],[15.9419, 17.2500],[15.9419, 18.4300],[15.9419, 18.4300],[15.6340, 19.3637],[14.8312, 19.9313],[0.0000, 20.0000],[14.3719, 20.0000],[-14.3719, 20.0000],[0.0000, 20.0000],[-14.8312, 19.9313],[-15.6340, 19.3637],[-15.9419, 18.4300],[-15.9419, 18.4300],[-15.9419, 17.2500],[-15.8732, 16.7907],[-15.3056, 15.9878],[-14.3719, 15.6800],[-14.3719, 15.6800],[-11.2850, 15.6800],[-10.8257, 15.6113],[-10.0228, 15.0437],[-9.7150, 14.1100],[-9.7150, 14.1100],[-9.7150, 13.6545],[-9.9373, 13.1174],[-9.9373, 13.1174],[-13.9582, 9.0915],[-14.5146, 8.6145],[-15.3776, 8.1130],[-16.3264, 7.8031],[-17.3191, 7.6982],[-17.3191, 7.6982],[-22.6809, 7.6982],[-23.4116, 7.7547],[-24.3763, 8.0110],[-25.2661, 8.4633],[-26.0418, 9.0915],[-26.0418, 9.0915],[-30.0627, 13.1174],[-30.2850, 13.6545],[-30.2850, 13.6545],[-30.2850, 14.1100],[-30.2163, 14.5693],[-29.6487, 15.3722],[-28.7150, 15.6800],[-28.7150, 15.6800],[-25.6300, 15.6800],[-25.1707, 15.7487],[-24.3678, 16.3163],[-24.0600, 17.2500],[-24.0600, 17.2500],[-24.0600, 18.4312],[-24.1287, 18.8907],[-24.6964, 19.6934],[-25.6302, 20.0012],[-25.6302, 20.0012],[-36.8303, 20.0000],[-37.7938, 19.8499],[-38.6832, 19.4019],[-39.3897, 18.7001],[-39.8435, 17.8137],[-40.0000, 16.8302],[-40.0000, 16.8302],[-40.0006, 5.6265],[-39.9319, 5.1670],[-39.3643, 4.3642],[-38.4306, 4.0564],[-38.4306, 4.0564],[-37.2499, 4.0564],[-36.7907, 4.1251],[-35.9878, 4.6927],[-35.6800, 5.6264],[-35.6800, 5.6264],[-35.6800, 8.7114],[-35.6113, 9.1708],[-35.0437, 9.9736],[-34.1100, 10.2814],[-34.1100, 10.2814],[-33.6509, 10.2814],[-33.1137, 10.0590],[-33.1137, 10.0590],[-29.1066, 6.0547],[-28.6305, 5.4993],[-28.1291, 4.6362],[-27.8191, 3.6874],[-27.7143, 2.6948],[-27.7143, 2.6948],[-27.7143, 0.0000],[-27.7143, 0.0000],[-27.7143, -2.6948],[-27.7143, -2.6948],[-27.8191, -3.6874],[-28.1291, -4.6362],[-28.6305, -5.4993],[-29.1066, -6.0547],[-33.1137, -10.0590],[-33.1137, -10.0590],[-33.6509, -10.2814],[-34.1100, -10.2814],[-34.1100, -10.2814],[-35.0437, -9.9736],[-35.6113, -9.1708],[-35.6800, -8.7114],[-35.6800, -5.6264],[-35.6800, -5.6264],[-35.9878, -4.6927],[-36.7907, -4.1251],[-37.2499, -4.0564],[-38.4306, -4.0564],[-38.4306, -4.0564],[-39.3643, -4.3642],[-39.9319, -5.1670],[-40.0006, -5.6265],[-40.0000, -16.8302],[-40.0000, -16.8302],[-39.8435, -17.8137],[-39.3897, -18.7001],[-38.6832, -19.4019],[-37.7938, -19.8499],[-36.8303, -20.0000],[-25.6302, -20.0012],[-25.6302, -20.0012],[-24.6964, -19.6934],[-24.1287, -18.8907],[-24.0600, -18.4312],[-24.0600, -17.2500],[-24.0600, -17.2500],[-24.3678, -16.3163],[-25.1707, -15.7487],[-25.6300, -15.6800],[-28.7150, -15.6800],[-28.7150, -15.6800],[-29.6487, -15.3722],[-30.2163, -14.5693],[-30.2850, -14.1100],[-30.2850, -13.6545],[-30.2850, -13.6545],[-30.0627, -13.1174],[-26.0418, -9.0915],[-26.0418, -9.0915],[-25.2661, -8.4633],[-24.3763, -8.0110],[-23.4116, -7.7547],[-22.6809, -7.6982],[-17.3191, -7.6982],[-17.3191, -7.6982],[-16.3264, -7.8031],[-15.3776, -8.1130],[-14.5146, -8.6145],[-13.9582, -9.0915],[-9.9373, -13.1174],[-9.9373, -13.1174],[-9.7150, -13.6545],[-9.7150, -14.1100],[-9.7150, -14.1100],[-10.0228, -15.0437],[-10.8257, -15.6113],[-11.2850, -15.6800],[-14.3719, -15.6800],[-14.3719, -15.6800],[-15.3056, -15.9878],[-15.8732, -16.7907],[-15.9419, -17.2500],[-15.9419, -18.4300],[-15.9419, -18.4300],[-15.6340, -19.3637],[-14.8312, -19.9313],[0.0000, -20.0000],[-14.3719, -20.0000]
                       ] );
};

module cutout40_4080() {
    polygon( points = [
[0.0000, -15.6800],[-4.0718, -15.6800],[-4.0718, -15.6800],[-4.9716, -15.3062],[-5.3418, -14.4100],[-5.3418, -12.1296],[-5.3418, -12.1296],[-5.7155, -11.2298],[-5.7163, -11.2290],[-10.9178, -6.0569],[-10.9178, -6.0569],[-11.5477, -5.2826],[-12.0019, -4.3938],[-12.2603, -3.4297],[-12.3185, -2.6887],[-12.3185, 0.0000],[-12.3185, 0.0000],[-12.3185, 2.6887],[-12.2603, 3.4297],[-12.0019, 4.3938],[-11.5477, 5.2826],[-10.9178, 6.0569],[-10.9178, 6.0569],[-5.7163, 11.2290],[-5.7155, 11.2298],[-5.3418, 12.1296],[-5.3418, 12.1296],[-5.3418, 14.4100],[-4.9716, 15.3062],[-4.0718, 15.6800],[-4.0718, 15.6800],[0.0000, 15.6800],[0.0000, 15.6800],[4.0718, 15.6800],[4.0718, 15.6800],[4.9716, 15.3062],[5.3418, 14.4100],[5.3418, 12.1296],[5.3418, 12.1296],[5.7155, 11.2298],[5.7163, 11.2290],[10.9178, 6.0569],[10.9178, 6.0569],[11.5477, 5.2826],[12.0019, 4.3938],[12.2603, 3.4297],[12.3185, 2.6887],[12.3185, 0.0000],[12.3185, 0.0000],[12.3185, -2.6887],[12.2603, -3.4297],[12.0019, -4.3938],[11.5477, -5.2826],[10.9178, -6.0569],[10.9178, -6.0569],[5.7163, -11.2290],[5.7155, -11.2298],[5.3418, -12.1296],[5.3418, -12.1296],[5.3418, -14.4100],[4.9716, -15.3062],[4.0718, -15.6800],[4.0718, -15.6800],[0.0000, -15.6800]
                       ]);

    translate([20,0]) circle(3.40, $fn=15);
    translate([-20,0]) circle(3.40, $fn=15);
}

if ( G8020DEBUG ) {
  item40_4080(100);
 }
