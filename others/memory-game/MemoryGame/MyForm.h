#pragma once
#include <vector>
#include <iostream>
#include <algorithm>
#include <cstdlib>
#include <cstdio>
#include <ctime>

#include <msclr\marshal_cppstd.h>
namespace MemoryGame {

	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;
	using namespace System::Windows::Forms;

	/// <summary>
	/// Summary for MyForm
	/// </summary>
	public ref class MyForm : public System::Windows::Forms::Form
	{
	public:
		MyForm(void)
		{
			InitializeComponent();
			//
			//TODO: Add the constructor code here
			//
			srand(time(NULL));
		}

	protected:
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		~MyForm()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::Button^  bStartGame;


	private: System::Windows::Forms::Button^  button1;
	private: System::Windows::Forms::Button^  button2;
	private: System::Windows::Forms::Button^  button3;
	private: System::Windows::Forms::Button^  button4;
	private: System::Windows::Forms::Button^  button5;


	private: System::Windows::Forms::Button^  button8;
	private: System::Windows::Forms::Button^  button9;
	private: System::Windows::Forms::Button^  button10;
	private: System::Windows::Forms::Button^  button11;
	private: System::Windows::Forms::Button^  button12;
	private: System::Windows::Forms::Button^  button13;
	private: System::Windows::Forms::Button^  button14;
	private: System::Windows::Forms::Button^  button15;
	private: System::Windows::Forms::Button^  button16;
	private: System::Windows::Forms::Button^  button7;
	private: System::Windows::Forms::Button^  button6;

	private: System::Windows::Forms::Label^  label_win;
	private: System::Windows::Forms::NumericUpDown^  numericUpDown1;

	protected:

	private:
		/// <summary>
		/// Required designer variable.
		/// </summary>
		System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		void InitializeComponent(void)
		{
			this->bStartGame = (gcnew System::Windows::Forms::Button());
			this->label_win = (gcnew System::Windows::Forms::Label());
			this->numericUpDown1 = (gcnew System::Windows::Forms::NumericUpDown());
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->numericUpDown1))->BeginInit();
			this->SuspendLayout();
			// 
			// bStartGame
			// 
			this->bStartGame->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(255)), static_cast<System::Int32>(static_cast<System::Byte>(224)),
				static_cast<System::Int32>(static_cast<System::Byte>(192)));
			this->bStartGame->Font = (gcnew System::Drawing::Font(L"MV Boli", 12, System::Drawing::FontStyle::Bold, System::Drawing::GraphicsUnit::Point,
				static_cast<System::Byte>(0)));
			this->bStartGame->Location = System::Drawing::Point(12, 91);
			this->bStartGame->Name = L"bStartGame";
			this->bStartGame->Size = System::Drawing::Size(232, 67);
			this->bStartGame->TabIndex = 36;
			this->bStartGame->Text = L"Start new game!";
			this->bStartGame->UseVisualStyleBackColor = false;
			this->bStartGame->Click += gcnew System::EventHandler(this, &MyForm::bStartGame_Click);
			// 
			// label_win
			// 
			this->label_win->AutoSize = true;
			this->label_win->Font = (gcnew System::Drawing::Font(L"MV Boli", 12, System::Drawing::FontStyle::Bold, System::Drawing::GraphicsUnit::Point,
				static_cast<System::Byte>(0)));
			this->label_win->Location = System::Drawing::Point(12, 67);
			this->label_win->Name = L"label_win";
			this->label_win->Size = System::Drawing::Size(232, 21);
			this->label_win->TabIndex = 55;
			this->label_win->Text = L"Congratulations, you won!";
			this->label_win->Visible = false;
			// 
			// numericUpDown1
			// 
			this->numericUpDown1->Increment = System::Decimal(gcnew cli::array< System::Int32 >(4) { 2, 0, 0, 0 });
			this->numericUpDown1->Location = System::Drawing::Point(109, 164);
			this->numericUpDown1->Maximum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 8, 0, 0, 0 });
			this->numericUpDown1->Minimum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 2, 0, 0, 0 });
			this->numericUpDown1->Name = L"numericUpDown1";
			this->numericUpDown1->ReadOnly = true;
			this->numericUpDown1->Size = System::Drawing::Size(42, 20);
			this->numericUpDown1->TabIndex = 56;
			this->numericUpDown1->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 2, 0, 0, 0 });
			// 
			// MyForm
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(255)), static_cast<System::Int32>(static_cast<System::Byte>(192)),
				static_cast<System::Int32>(static_cast<System::Byte>(128)));
			this->ClientSize = System::Drawing::Size(256, 238);
			this->Controls->Add(this->numericUpDown1);
			this->Controls->Add(this->label_win);
			this->Controls->Add(this->bStartGame);
			this->FormBorderStyle = System::Windows::Forms::FormBorderStyle::FixedSingle;
			this->MaximizeBox = false;
			this->Name = L"MyForm";
			this->StartPosition = System::Windows::Forms::FormStartPosition::CenterScreen;
			this->Text = L"Memory";
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->numericUpDown1))->EndInit();
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion
	private:
		System::Decimal size;
		cli::array<wchar_t>^ labels;
		int clicks = 0;
		Object^ prevClickedButtonId;
		Object^ clickedButtonId;

		void showGameButtons() {
			IEnumerator^ it = this->Controls->GetEnumerator();
			it->MoveNext();
			it->MoveNext();
			it->MoveNext();
			while (it->MoveNext()) {
				Button^ btn = (Button^)it->Current;
				btn->Text = "";
				btn->Visible = true;
				btn->Enabled = true;
			}
		}

		void hideGameButtons() {
			IEnumerator^ it = this->Controls->GetEnumerator();
			it->MoveNext();
			it->MoveNext();
			it->MoveNext();
			while (it->MoveNext()) {
				Button^ btn = (Button^)it->Current;
				btn->Visible = false;
			}
		}

		System::Void bStartGame_Click(System::Object^  sender, System::EventArgs^  e) {
			
			
			size = numericUpDown1->Value;

			this->ClientSize = System::Drawing::Size(safe_cast<int>(size * 62) - 20, safe_cast<int>(size*62) );
			

			for (int i = 0; i < size; i++) {
				for (int k = 0; k < size; k++) {
					Button^ button1 = (gcnew System::Windows::Forms::Button());
					button1->Location = System::Drawing::Point(12+50*i, 12+50*k);
					button1->Name = L"button1";
					button1->Size = System::Drawing::Size(50, 50);
					button1->TabIndex = 39;
					button1->Tag = (wchar_t)(i*size) + (wchar_t)k;
					button1->UseVisualStyleBackColor = true;
					button1->Visible = false;
					button1->Click += gcnew System::EventHandler(this, &MyForm::button_Click);
					this->Controls->Add(button1);
				}
			}
			showGameButtons();
			bStartGame->Visible = false;
			bStartGame->Enabled = false;

			label_win->Visible = false;

			numericUpDown1->Visible = false;

			labels = gcnew cli::array<wchar_t> (int(size*size));
			for (int i = 0; i < (size*size/2); ++i) {
				labels[i] = i + 65;
				labels[i+(int)(size*size / 2)] = i + 65;

			}
			int number_of_shuffles = rand() % 30;
			for (int i = 0; i < number_of_shuffles; i++) {

				int first = rand() % (int)(size*size);
				int second = rand() % (int)(size*size);

				int tmp = labels[first];
				labels[first] = labels[second];
				labels[second] = tmp;
			}
		}

		int objectToInt(Object^ tag) {
			
			if (tag == (wchar_t)1) return 0;
			else if (tag == (wchar_t)2) return 1;
			else if (tag == (wchar_t)3) return 2;
			else if (tag == (wchar_t)4) return 3;
			else if (tag == (wchar_t)5) return 4;
			else if (tag == (wchar_t)6) return 5;
			else if (tag == (wchar_t)7) return 6;
			else if (tag == (wchar_t)8) return 7;
			else if (tag == (wchar_t)9) return 8;
			else if (tag == (wchar_t)10) return 9;
			else if (tag == (wchar_t)11) return 10;
			else if (tag == (wchar_t)12) return 11;
			else if (tag == (wchar_t)13) return 12;
			else if (tag == (wchar_t)14) return 13;
			else if (tag == (wchar_t)15) return 14;
			else if (tag == (wchar_t)16) return 15;
			else if (tag == (wchar_t)17) return 16;
			else if (tag == (wchar_t)18) return 17;
			else if (tag == (wchar_t)19) return 18;
			else if (tag == (wchar_t)20) return 19;
			else if (tag == (wchar_t)21) return 20;
			else if (tag == (wchar_t)22) return 21;
			else if (tag == (wchar_t)23) return 22;
			else if (tag == (wchar_t)24) return 23;
			else if (tag == (wchar_t)25) return 24;
			else if (tag == (wchar_t)26) return 25;
			else if (tag == (wchar_t)27) return 26;
			else if (tag == (wchar_t)28) return 27;
			else if (tag == (wchar_t)29) return 28;
			else if (tag == (wchar_t)30) return 29;
			else if (tag == (wchar_t)31) return 30;
			else if (tag == (wchar_t)32) return 31;
			else if (tag == (wchar_t)33) return 32;
			else if (tag == (wchar_t)34) return 33;
			else if (tag == (wchar_t)35) return 34;
			else if (tag == (wchar_t)36) return 35;

			else return 15;
		}

		Button^ findButton(Object^ tag) {

			IEnumerator^ it = this->Controls->GetEnumerator();
			it->MoveNext();
			it->MoveNext();
			it->MoveNext();
			int i = 0;
			while (it->MoveNext()) {
				Button^ btn = (Button^)it->Current;
				if (btn->Tag == tag)
					return btn;
			}
			return nullptr;
		}

		bool checkIfWin() {
			IEnumerator^ it = this->Controls->GetEnumerator();
			it->MoveNext();
			it->MoveNext();
			it->MoveNext();
			int i = 0;
			while (it->MoveNext()) {
				Button^ btn = (Button^)it->Current;
				if (btn->Enabled == true)
					return false;
			}
			return true;
		}

		void gameWon() {
			this->ClientSize = System::Drawing::Size(272, 277);
			hideGameButtons();
			bStartGame->Visible = true;
			bStartGame->Enabled = true;
			label_win->Visible = true;
			numericUpDown1->Visible = true;
			clicks = 0;
			prevClickedButtonId = nullptr;
			clickedButtonId = nullptr;

			int i = 3;
			while(this->Controls->Count != 3) {
				this->Controls->RemoveAt(i);
			}

		}

		System::Void button_Click(System::Object^  sender, System::EventArgs^ e) {

			clicks++;
			if (clicks == 3) {
				clicks = 1;
				Button^ btn1 = findButton(prevClickedButtonId);
				Button^ btn2 = findButton(clickedButtonId);
				if (btn1->Enabled == true && btn2->Enabled == true) {
					btn1->Text = "";
					btn2->Text = "";
				}
			}

			Button^ button = (Button^)sender;
			Object^ tag = button->Tag;
			prevClickedButtonId = clickedButtonId;
			clickedButtonId = tag;
			button->Text = labels[safe_cast<int>(clickedButtonId)].ToString();

			if (prevClickedButtonId == clickedButtonId)
				clicks=1;
			else if (clicks == 2) {
					Button^ btn1 = findButton(prevClickedButtonId);
					Button^ btn2 = findButton(clickedButtonId);
					if (btn1->Text == btn2->Text) {
						btn1->Enabled = false;
						btn2->Enabled = false;
					}
			}
			if (checkIfWin()) {
				gameWon();
			}
		}
	
};
};

