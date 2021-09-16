import { Component, h, State } from '@stencil/core';
import AppCenter, { CustomProperties, LogLevel } from '@capacitor-community/appcenter';

@Component({
  tag: 'app-home',
  styleUrl: 'app-home.css',
})
export class AppHome {
  /* App Center UUID */
  installId: String = 'unknown'
  /* App Center SDK Version */
  sdkVersion: String = 'unknown'
  /* App Center Custom Properties */
  customProperties: CustomProperties
  /* App Center userId */
  userId: string;
  /* Flag to toggle App Center SDK */
  @State() enabled: boolean = false
  /* Flag to toggle App Center network requests */
  @State() networkReqAllowed: boolean = false
  /* App Center LogLevel */
  @State() logLevel: LogLevel;

  constructor() {
    this.updateUserId = this.updateUserId.bind(this);
    this.toggleSdk = this.toggleSdk.bind(this);
    this.setLogLevel = this.setLogLevel.bind(this);
    this.toggleNetwork = this.toggleNetwork.bind(this)
  }

  async componentWillLoad() {
    console.debug('[homepage] componentWillLoad')

    const { value: sdkEnabled } = await AppCenter.isEnabled()
    // const { value: reqAllowed } = await AppCenter.networkRequestsAllowed()
    const { value: installId } = await AppCenter.getInstallId()
    const { value: sdkVersion } = await AppCenter.getSdkVersion()
    const { value: logLevel } = await AppCenter.getLogLevel()

    this.installId = installId
    this.sdkVersion = sdkVersion
    this.enabled = sdkEnabled
    this.logLevel = logLevel
    // this.networkReqAllowed = reqAllowed

    console.debug(logLevel)

    // this.customProperties = new CustomProperties()
    // this.customProperties.set('color', 'blue').set('score', 10).set('result', true).set("timestamp", new Date())
    // console.debug(this.customProperties)

    // AppCenter.setCustomProperties({properties: this.customProperties});    
  }

  componentDidLoad() {
    console.debug('[homepage] componentDidLoad')
  }

  componentWillRender() {
    console.debug('[homepage] componentWillRender')
  }

  componentDidRender() {
    console.debug('[homepage] componentDidRender')
  }

  componentDidUpdate(){
    console.debug('[homepage] componentDidUpdate')
  }

  disconnectedCallback() {
    console.debug('[homepage] disconnectedCallback')
  }

  async updateUserId(e: CustomEvent) {
    this.userId = e.detail.value

    try {
      if (this.userId !== "") await AppCenter.setUserId({userId: this.userId})
    } catch (error) {
      console.error(error)
    }
  }

  async toggleSdk(e: CustomEvent) {
    console.debug("[homepage] toggleSdk");
    try {
      await AppCenter.setEnable({shouldEnable: e.detail.checked});
      this.enabled = e.detail.checked
    } catch (error) {
      this.enabled = false
      console.error(error)
    }
  }

  async toggleNetwork(e: CustomEvent) {
    console.debug("[homepage] toggleNetwork");
    try {
      await AppCenter.networkRequestsAllowed({shouldAllow: e.detail.checked});
      this.networkReqAllowed = e.detail.checked
    } catch (error) {
      this.enabled = false
      console.error(error)
    }
  }

  async setLogLevel(logLevel: LogLevel) {
    try {
      await AppCenter.setLogLevel({logLevel: logLevel})
      this.logLevel = logLevel
    } catch (error) {
      console.error(error);
    }
  }
  
  render() {
    return [
      <ion-header>
        <ion-toolbar color="primary">
          <ion-title>demo</ion-title>
        </ion-toolbar>
      </ion-header>,

      <ion-content class="ion-padding">
        <h3>AppCenter Capacitor SDK</h3>
        <p>Welcome! Tap on the links below to test various features of the Appcenter SDK</p>
        <ion-list lines="full" class="ion-no-margin">
          <ion-item>
            <ion-label>Enable All Services</ion-label>
            <ion-toggle checked={this.enabled} onIonChange={(event) => this.toggleSdk(event)} />
          </ion-item>
          <ion-item>
            <ion-label>App Center SDK</ion-label>
            <ion-note slot="end">{this.sdkVersion}</ion-note>
          </ion-item>
          <ion-item>
            <ion-label>Allow Network Requests</ion-label>
            <ion-toggle checked={this.networkReqAllowed} onIonChange={(event) => this.toggleNetwork(event)} />
          </ion-item>
          <ion-item>
            <ion-label>Log Level</ion-label>
            <ion-select placeholder="Select One" value={this.logLevel} onIonChange={event => this.setLogLevel(event.detail.value)}>
              <ion-select-option value={LogLevel.VERBOSE}>Verbose</ion-select-option>
              <ion-select-option value={LogLevel.DEBUG}>Debug</ion-select-option>
              <ion-select-option value={LogLevel.INFO}>Info</ion-select-option>
              <ion-select-option value={LogLevel.WARNING}>Warning</ion-select-option>
              <ion-select-option value={LogLevel.ERROR}>Error</ion-select-option>
              <ion-select-option value={LogLevel.ASSERT}>Assert</ion-select-option>
              <ion-select-option value={LogLevel.NONE}>None</ion-select-option>
            </ion-select>
          </ion-item>
          <ion-item>
            <ion-label position="stacked">User ID</ion-label>
            <ion-input onIonChange={event => this.updateUserId(event)} placeholder="type-user-id" type="text" value={this.userId}></ion-input>
          </ion-item>
          <ion-item>
            <ion-label>
              <h2>Install ID</h2>
              <p>{this.installId}</p>
            </ion-label>
          </ion-item>
          <ion-item href="/analytics">
            <ion-label>Analytics</ion-label>
          </ion-item>
          <ion-item href="/crashes">
            <ion-label>Crashes</ion-label>
          </ion-item>
        </ion-list>
      </ion-content>,
    ];
  }
}
