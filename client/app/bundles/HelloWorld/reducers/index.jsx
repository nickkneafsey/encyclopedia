// This file is our manifest of all reducers for the app.
// See also /client/app/bundles/HelloWorld/store/helloWorldStore.jsx
// A real world app will likely have many reducers and it helps to organize them in one file.
import helloWorldReducer from './helloWorldReducer';
import playersReducer from './playersReducer';
import { $$initialState as $$helloWorldState } from './helloWorldReducer';
import { $$initialState as $$playersState } from './playersReducer';

export default {
  $$appStore: helloWorldReducer,
  $$playersStore: playersReducer,
};

export const initialStates = {
  $$helloWorldState,
  $$playersState,
};
