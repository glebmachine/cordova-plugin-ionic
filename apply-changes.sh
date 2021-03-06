# local manual "watch" script
set -o errexit

# Script vars
APP_NAME=${IONIC_APP_NAME:-testapp}

# Sync to iOS
cp ../${APP_NAME}/plugins/cordova-plugin-ionic/dist/* ../${APP_NAME}/platforms/ios/www/plugins/cordova-plugin-ionic/dist/
sed -i '' 's/"use strict"/cordova.define("cordova-plugin-ionic.common", function(require, exports, module) {"use strict"/' ../${APP_NAME}/platforms/ios/www/plugins/cordova-plugin-ionic/dist/common.js
sed -i '' 's/"use strict"/cordova.define("cordova-plugin-ionic.guards", function(require, exports, module) {"use strict"/' ../${APP_NAME}/platforms/ios/www/plugins/cordova-plugin-ionic/dist/guards.js
echo '});' >> ../${APP_NAME}/platforms/ios/www/plugins/cordova-plugin-ionic/dist/common.js
echo '});' >> ../${APP_NAME}/platforms/ios/www/plugins/cordova-plugin-ionic/dist/guards.js

# Sync to Android
cp ../${APP_NAME}/plugins/cordova-plugin-ionic/dist/* ../${APP_NAME}/platforms/android/platform_www/plugins/cordova-plugin-ionic/dist/
sed -i '' 's/"use strict"/cordova.define("cordova-plugin-ionic.common", function(require, exports, module) {"use strict"/' ../${APP_NAME}/platforms/android/platform_www/plugins/cordova-plugin-ionic/dist/common.js
sed -i '' 's/"use strict"/cordova.define("cordova-plugin-ionic.guards", function(require, exports, module) {"use strict"/' ../${APP_NAME}/platforms/android/platform_www/plugins/cordova-plugin-ionic/dist/guards.js
echo '});' >> ../${APP_NAME}/platforms/android/platform_www/plugins/cordova-plugin-ionic/dist/common.js
echo '});' >> ../${APP_NAME}/platforms/android/platform_www/plugins/cordova-plugin-ionic/dist/guards.js
