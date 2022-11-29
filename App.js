import React, {useCallback} from 'react';
import {SafeAreaView, Button, NativeModules} from 'react-native';

export default () => {
  const jinkookInit = useCallback(() => {
    NativeModules.RNBridge.jinkookInit();
  }, []);

  const jinkookFeed = useCallback(() => {
    NativeModules.RNBridge.jinkookFeed();
  }, []);

  return (
    <SafeAreaView
      style={{flex: 1, justifyContent: 'space-around', alignItems: 'center'}}>
      <Button title="Popcorn init" onPress={jinkookInit} />
      <Button title="Popcorn feed" onPress={jinkookFeed} />
    </SafeAreaView>
  );
};
