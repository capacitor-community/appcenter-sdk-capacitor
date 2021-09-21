import { Component, State, h } from '@stencil/core';
import { ToggleChangeEventDetail } from '@ionic/core';
import Crashes, { ErrorReport, ExceptionModel, ErrorAttachmentLog } from '@capacitor-community/appcenter-crashes';

@Component({
  tag: 'app-crashes',
  styleUrl: 'app-crashes.css',
})
export class AppCrashes {
  /* Flag to toggle entire Crashes service */
  @State() enabled: boolean = false
  @State() memoryWarning: boolean = false
  @State() hasCrashed: boolean = false
  @State() crashReport: ErrorReport
  /* Track error fields */
  @State() errorType: string = "";
  @State() errorMessage: string = "";
  @State() propertyName: string = "";
  @State() propertyValue: string = "";
  @State() attachmentText: string = "";
  @State() attachmentName: string = "";


  constructor() {
    this.toggleCrashes = this.toggleCrashes.bind(this);
    this.crashApp = this.crashApp.bind(this);
  }

  async componentWillLoad() {
    try {
      const { value: crashesEnabled } = await Crashes.isEnabled();
      const { value: memoryWarning } = await Crashes.hasReceivedMemoryWarningInLastSession();
      const { value: hasCrashed } = await Crashes.hasCrashedInLastSession();
      // const { value: crashReport } = await Crashes.lastSessionCrashReport();

      this.enabled = crashesEnabled
      this.memoryWarning = memoryWarning
      this.hasCrashed = hasCrashed
      // console.debug(crashReport)

    } catch (error) {
      console.error(error)
    }
  }

  async toggleCrashes(e: CustomEvent<ToggleChangeEventDetail>) {
    try {
      await Crashes.setEnabled({enable: e.detail.checked});
      this.enabled = e.detail.checked
    } catch (error) {
      this.enabled = false
      console.error(error)
    }
  }

  async crashApp() {
    try {
      await Crashes.generateTestCrash()
    } catch (error) {

    }
  }

  async trackError() {
    try {
      const error = ExceptionModel.createFromTypeAndMessage(this.errorType, this.errorMessage);
      const properties = { [this.propertyName]: this.propertyValue };
      const attachments = [
        ErrorAttachmentLog.attachmentWithText(this.attachmentText, this.attachmentName)
      ];
      await Crashes.trackError({ error, properties, attachments });
    } catch (error) {
      console.error(error)
    }
  }

  render() {
    return [
      <ion-header>
        <ion-toolbar color="primary">
          <ion-buttons slot="start">
            <ion-back-button defaultHref="/" />
          </ion-buttons>
        </ion-toolbar>
      </ion-header>,

      <ion-content class="ion-padding">
        <h3>App Center Crashes</h3>
        <p>App Center Crashes will automatically generate a crash log every time your app crashes.</p>

        <ion-list lines="full" class="ion-no-margin">
          <ion-item>
            <ion-label>Enable Crashes</ion-label>
            <ion-toggle checked={this.enabled} onIonChange={e => this.toggleCrashes(e)} />
          </ion-item>
          <ion-item>
            <ion-label>Memory Warning</ion-label>
            <ion-note slot="end">{this.memoryWarning.toString()}</ion-note>
          </ion-item>
          <ion-item>
            <ion-label>Crashed Prior</ion-label>
            <ion-note slot="end">{this.hasCrashed.toString()}</ion-note>
          </ion-item>
        </ion-list>

        <ion-list lines="full" class="ion-no-margin">
          <ion-list-header lines="full">
            <ion-label>
              Track Error
            </ion-label>
          </ion-list-header>
          <ion-item>
            <ion-label position="stacked">Error type</ion-label>
            <ion-input disabled={!this.enabled} placeholder="Error" value={this.errorType} onIonChange={e => {this.errorType = e.detail.value}}></ion-input>
          </ion-item>
          <ion-item>
            <ion-label position="stacked">Error message</ion-label>
            <ion-input disabled={!this.enabled} placeholder="'number' cannot be null" value={this.errorMessage} onIonChange={e => {this.errorMessage = e.detail.value}}></ion-input>
          </ion-item>
          <ion-item>
            <ion-label position="stacked">Property Name</ion-label>
            <ion-input disabled={!this.enabled} placeholder="category" value={this.propertyName} onIonChange={e => {this.propertyName = e.detail.value}}></ion-input>
          </ion-item>
          <ion-item>
            <ion-label position="stacked">Property Value</ion-label>
            <ion-input disabled={!this.enabled} placeholder="music" value={this.propertyValue} onIonChange={e => {this.propertyValue = e.detail.value}}></ion-input>
          </ion-item>
          <ion-item>
            <ion-label position="stacked">Attachment Name</ion-label>
            <ion-input disabled={!this.enabled} placeholder="attachment.txt" value={this.attachmentName} onIonChange={e => {this.attachmentName = e.detail.value}}></ion-input>
          </ion-item>
          <ion-item>
            <ion-label position="stacked">Attachment Text</ion-label>
            <ion-input disabled={!this.enabled} placeholder="Additional text for error" value={this.attachmentText} onIonChange={e => {this.attachmentText = e.detail.value}}></ion-input>
          </ion-item>
        </ion-list>
        <br/>
        <ion-button disabled={!this.enabled} onClick={this.trackError} expand="block">Track Error</ion-button>

        <section>
          <header>Generate a Test Crash</header>
          <ion-button color="danger" expand="block" onClick={this.crashApp}>Let app crash</ion-button>
        </section>

        <ion-list>
          <ion-list-header lines="full">
            <ion-label>Crash Report</ion-label>
          </ion-list-header>

          { this.crashReport ? Object.keys(this.crashReport).map(key => {
            <ion-item>
              <ion-label>{key}</ion-label>
            </ion-item>
          }) : null}
        </ion-list>

      </ion-content>,
    ];
  }
}
